
+ UPDATE
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