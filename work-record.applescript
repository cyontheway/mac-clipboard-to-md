on run {input, parameters}
    -- 获取剪贴板内容
    set theClipboard to get the clipboard as text

    -- 检查剪贴板是否有内容
    if theClipboard is "" then
        display dialog "剪贴板中没有文本内容！" buttons {"OK"} default button 1
        return
    end if

    -- 获取当前时间并格式化
    set currentDate to current date

    -- 日期补零处理
    set theYear to year of currentDate
    set theMonth to month of currentDate as number
    set theDay to day of currentDate
    if theMonth < 10 then set theMonth to "0" & theMonth
    if theDay < 10 then set theDay to "0" & theDay
    set timeStamp to theYear & "-" & theMonth & "-" & theDay & " " & (time string of currentDate)

    -- 构建要写入的内容
    set contentToWrite to "# " & timeStamp & return & theClipboard & return & return & return

    -- 设置文件路径（请修改为你自己的路径）
    set filePath to "/Users/你的用户名/Documents/Work record.md"

    try
        -- 检查文件是否存在
        set fileExists to false
        try
            do shell script "test -f " & quoted form of filePath
            set fileExists to true
        on error
            set fileExists to false
        end try

        if fileExists then
            -- 读取文件内容
            set fileContent to do shell script "export LANG=en_US.UTF-8; cat " & quoted form of filePath

            -- 将文件内容按行分割
            set AppleScript's text item delimiters to return
            set linesList to text items of fileContent
            set AppleScript's text item delimiters to ""

            -- 确保文件至少有9行
            if (count of linesList) < 9 then
                -- 如果不足9行，直接追加到末尾
                set finalContent to fileContent & return & contentToWrite
            else
                -- 提取前8行（索引1到8）
                set headerLines to {}
                repeat with i from 1 to 8
                    if i ≤ (count of linesList) then
                        set end of headerLines to item i of linesList
                    end if
                end repeat

                -- 提取第9行及之后的内容
                set bodyLines to {}
                repeat with i from 9 to (count of linesList)
                    set end of bodyLines to item i of linesList
                end repeat

                -- 重新组合：前8行 + 新内容 + 剩余内容
                set headerText to ""
                repeat with i from 1 to (count of headerLines)
                    set headerText to headerText & item i of headerLines
                    if i < (count of headerLines) then
                        set headerText to headerText & return
                    end if
                end repeat

                set bodyText to ""
                if (count of bodyLines) > 0 then
                    repeat with i from 1 to (count of bodyLines)
                        set bodyText to bodyText & item i of bodyLines
                        if i < (count of bodyLines) then
                            set bodyText to bodyText & return
                        end if
                    end repeat
                end if

                -- 组合最终内容
                if bodyText is not "" then
                    set finalContent to headerText & return & contentToWrite & bodyText
                else
                    set finalContent to headerText & return & contentToWrite
                end if
            end if

            -- 写入整个文件
            set escapedContent to quoted form of finalContent
            do shell script "export LANG=en_US.UTF-8; printf '%s' " & escapedContent & " > " & quoted form of filePath
        else
            -- 文件不存在，直接创建（包含属性行）
            set defaultHeader to "---" & return & "title: Work Record" & return & "created: " & timeStamp & return & "updated: " & timeStamp & return & "tags: []" & return & "---" & return & return
            set finalContent to defaultHeader & contentToWrite
            set escapedContent to quoted form of finalContent
            do shell script "export LANG=en_US.UTF-8; printf '%s' " & escapedContent & " > " & quoted form of filePath
        end if

        display notification "内容已成功添加到 Work record.md" with title "操作成功"
    on error errMsg
        display dialog "写入文件时出错: " & errMsg buttons {"OK"} default button 1
    end try

    return input
end run
