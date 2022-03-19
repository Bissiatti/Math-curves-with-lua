require 'symmath' .setup()
local gnuplot = require 'gnuplot'

local a,b,c,d,t,f,r,s= symmath.vars("a","b","c","d","t","f","r","s")

local function derivadaTex(c,var)
    local u;
    local t = var or symmath.vars("t")

    local dif = c:diff(t)()
    u = dif:norm()

    return {c,dif,u,symmath.export.LaTeX(c),symmath.export.LaTeX(dif),symmath.export.LaTeX(u)}
end

function comprimento(c,var,a,b)

    a = a or 0
    b = b or 0

    local t = var or symmath.vars("t")

    local u = c:diff(t)():norm()

    if a ==0 or b== 0 then
        u = u:integrate(t)();
    else
        u = u:integrate(t,a,b)()
    end

    return {u,symmath.export.LaTeX(u)}

end

function curvaturaR2(c,var)
    local u = symmath.Array()
    local t = var or symmath.vars("t")

    local dif1 = c:diff(t)()
    local dif2 = dif1:diff(t)()
    local u = dif1:norm()

    local r = ((dif1[1]*dif2[2])-(dif1[2]*dif2[1]))/(u)^3

    return {r,symmath.export.LaTeX(r)}

end

-- Exemplos

-- local a1 = symmath.Array(a+b*t,c+d*t)

-- for index, value in ipairs(derivadaTex(a1)) do
--     print(value)
-- end

-- print("comprimento\n")

-- for index, value in ipairs(comprimento(a1)) do
--     print(value)
-- end

-- print("curvatura\n")

-- for index, value in ipairs(curvaturaR2(a1)) do
--     print(value)
-- end


-- local b1 = symmath.Array(t,t^4)

-- for index, value in ipairs(derivadaTex(b1)) do
--     print(value)
-- end


-- for index, value in ipairs(comprimento(b1)) do
--     print(value)
-- end

-- for index, value in ipairs(curvaturaR2(b1)) do
--     print(value)
-- end

-- local b1 = symmath.Array(a + r*cos(s/r), b + r*sin(s/r))

-- for index, value in ipairs(derivadaTex(b1,s)) do
--     print(value)
-- end

-- print("comprimento")

-- for index, value in ipairs(comprimento(b1,s)) do
--     print(value)
-- end

-- print("curvatura")

-- for index, value in ipairs(curvaturaR2(b1,s)) do
--     print(value)
-- end


-- local d1 = symmath.Array((cos(t)*(2*cos(t) - 1)), (sin(t)*(2*cos(t) - 1)))

-- for index, value in ipairs(derivadaTex(d1,s)) do
--     print(value)
-- end

-- print("comprimento")

-- for index, value in ipairs(comprimento(d1,s)) do
--     print(value)
-- end

-- print("curvatura")

-- for index, value in ipairs(curvaturaR2(d1,s)) do
--     print(value)
-- end