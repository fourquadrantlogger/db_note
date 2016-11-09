
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