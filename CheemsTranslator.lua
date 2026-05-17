local SCRIPT_URL =
"https://gist.githubusercontent.com/dev-kabir/2287bf40bcededc4c66edfa4cc42e239/raw/Main.lua"

local function HttpGet(url)

    local curl =
        Curl.Easy()

    curl:Setopt(
        eCurlOption.CURLOPT_URL,
        url
    )

    curl:Perform()

    local timeout =
        os.clock() + 5

    while not curl:GetFinished() do

        if os.clock() > timeout then
            return nil
        end

    end

    local code, response =
        curl:GetResponse()

    return response
end

local script =
    HttpGet(
        SCRIPT_URL
    )

if script then

    local func =
        load(script)

    if func then

        local ok, err =
            pcall(func)

        if not ok then

            GUI.AddToast(
                "",
                "Loader Error",
                5000
            )

            Logger.LogError(err)

        end

    else

        GUI.AddToast(
            "",
            "Failed To Load Script",
            5000
        )

    end

else

    GUI.AddToast(
        "",
        "Failed To Download Script",
        5000
    )

end
