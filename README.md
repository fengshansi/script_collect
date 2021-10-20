# 脚本收集
 收集常用脚本
# powershell脚本
## Get-FoldersWithSize.ps1
统计子文件夹大小（不统计普通文件）  
[脚本来源stackoverflow](https://stackoverflow.com/questions/42391237/powershell-folder-size-sort-with-auto-size-conversion)
 


用法
```
#当前文件夹(默认)
.\Get-FoldersWithSize.ps1

#相对路径
.\Get-FoldersWithSize.ps1 -Path ".\Downloads"

#绝对路径
.\Get-FoldersWithSize.ps1 -Path "C:\ProgramData"
```

## UWP_Loopback.ps1
用于将UWP程序加入本地环回，以访问系统代理。  
[脚本来源GitHub: ddadaal](https://ddadaal.me/articles/make-uwp-apps-use-loopback-system-proxy-using-powershell-script)  
用法
```
# 以Microsoft Todo为例，-Contain用于匹配和过滤
❯ gsudo .\UWP_Loopback.ps1 -Contain todo

Num DisplayName
--- -----------
    @{Microsoft.Todos_2.55.42812.0_x64__8wekyb3d8bbwe?ms-resource://Microsoft.Todos/Resources/app_name_ms_todo}

回复序号并回车提交（若只有一项，输入0），添加指定应用到排除列表中:
# 输入序号即可，此例中序号为0

```

# 配置文件
## .vimrc配置文件
用于配置vim。精简无插件的.vimrc。

# 一键环境配置脚本 tzh_env.sh
zsh部分未测试
整体未测试