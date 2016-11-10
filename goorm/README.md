
## UPDATE

+ db.Model(&Struct{}).Where.Updates(columns)
```
res = db.Model(&Account{}).
			Where("uid = ?", w.UID).
			Where("withdrawing >= ?", w.Amount).
			Updates(map[string]interface{}{
			"withdrawing": gorm.Expr("withdrawing - ?", w.Amount),
			"income":      gorm.Expr("income + ?", w.Amount),
		})
		if res.Error != nil {
			return res.Error
		}
		if res.RowsAffected != 1 {
			return errors.ErrUpdateError
		}
```

## SELECT

+ first
```
func GetProductById(id uint) (*Product, error) {
	p := &Product{}
	err := database.WithDefault(func(db *gorm.DB) error {
		res := db.Where("delete_at = 0").First(p, id)
		if res.RecordNotFound() {
			return errors.ErrProductNotExists
		}
		return res.Error
	})
	if err != nil {
		return nil, err
	}
	return p.Fix(), nil
}
```

+
```
func All(uid uint) ([]*Cart, error) {
	ret := []*Cart{}
	err := database.WithDefault(func(db *gorm.DB) error {
		return db.Where("uid = ?", uid).Find(&ret).Error
	})
	if err != nil {
		return nil, err
	}
	return ret, nil
}
```

## 非事务

```
func Default(reopen ...bool) (*gorm.DB, error) {
	var is_reopen = false
	if len(reopen) > 0 && reopen[0] {
		is_reopen = true
	}

	if default_db != nil {
		if is_reopen {
			default_db.Close()
		} else {
			return default_db, nil
		}
	}

	if db, err := gorm.Open(Driver, Dsn); err != nil {
		return nil, err
	} else {
		db.SingularTable(true)
		db.LogMode(ShowSQL)
		if MaxIdel > 0 {
			db.DB().SetMaxIdleConns(MaxIdel)
		}
		if MaxOpen > 0 {
			db.DB().SetMaxOpenConns(MaxOpen)
		}
		db.SetLogger(log.StandardLogger())
		default_db = db
	}
	return default_db, nil
}

func WithDefault(fn func(*gorm.DB) error) error {
	if db, err := Default(); err != nil {
		return err
	} else {
		return fn(db)
	}
}

```
## 事务

```

func Transact(txFunc func(*gorm.DB) error) (err error) {
	return WithDefault(func(db *gorm.DB) error {
		tx := db.Begin()
		if tx.Error != nil {
			return tx.Error
		}

		defer func() {
			if p := recover(); p != nil {
				switch p := p.(type) {
				case error:
					err = p
				default:
					err = fmt.Errorf("%s", p)
				}
				db.Rollback()
			}
		}()

		if err = txFunc(tx); err != nil {
			tx.Rollback()
			return err
		} else {
			tx.Commit()
			return nil
		}
	})
}
```