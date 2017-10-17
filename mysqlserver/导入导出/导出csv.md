```
mysql -h 10.19.25.160 -u admin -pvq2Hke6xMKwmmc --default-character-set=utf8 -e ' SELECT KsyunLive.AccountInfo.BusinessId 客户id,KsyunLive.AccountInfo.UserAccount 手机号 FROM KsyunLive.AccountInfo where KsyunLive.AccountInfo.QudaoId=1 ' | sed 's/\t/","/g;s/^/"/;s $/"/;s/\n//g' > 注册表里的手机号.csv;
```