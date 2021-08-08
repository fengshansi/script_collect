# 脚本收集
 收集常用脚本
# powershell脚本
## Get-FoldersWithSize.ps1
统计子文件夹大小（不统计普通文件）[脚本来源stackoverflow](https://stackoverflow.com/questions/42391237/powershell-folder-size-sort-with-auto-size-conversion)
 


用法
```
#当前文件夹(默认)
.\Get-FoldersWithSize.ps1

#相对路径
.\Get-FoldersWithSize.ps1 -Path ".\Downloads"

#绝对路径
.\Get-FoldersWithSize.ps1 -Path "C:\ProgramData"
```