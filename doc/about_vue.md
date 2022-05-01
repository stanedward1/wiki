**解决创建vue工程时的此类报错**
```shell
npm ERR! code ERR_SOCKET_TIMEOUT
npm ERR! network Socket timeout
npm ERR! network This is a problem related to network connectivity.
npm ERR! network In most cases you are behind a proxy or have bad network settings.
npm ERR! network
npm ERR! network If you are behind a proxy, please make sure that the
npm ERR! network 'proxy' config is set properly.  See: 'npm help config'

npm ERR! A complete log of this run can be found in:
npm ERR!     /root/.npm/_logs/2022-04-30T15_24_58_415Z-debug-0.log
 ERROR  command failed: npm install --loglevel error --legacy-peer-deps

```
使用``npm install rxjs``，再进行重试
