```
bogon:~ ceshi$ ssh -L 3308:127.0.0.1:3306 -p 8822 -t -x lipeng@123.206.49.45
The authenticity of host '[123.206.49.45]:8822 ([123.206.49.45]:8822)' can't be established.
ECDSA key fingerprint is SHA256:x/FluVYijnS/GKK8O27n2UAIz7hiIJ+6re+gvceo+3g.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '[123.206.49.45]:8822' (ECDSA) to the list of known hosts.

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
lipeng@VM-8-195-debian:~$
```

ssh -N -C xpai-prod-tunnel -L 9999:10.0.1.2:3306