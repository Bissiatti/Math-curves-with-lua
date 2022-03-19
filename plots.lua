require "curveFunctions"
local gnuplot = require 'gnuplot'

local x,y,t,e,c = vars('x','y','t','e','c')

e = Array(4+2*cos(t),3*sin(t))
c = Array(cos(t),sin(t))

local toPlot = {"set parametric",persist = true,using='1:1'}

for index, value in ipairs(e) do
    table.insert(toPlot,{symmath.export.SingleLine(value)})
end

for index, value in ipairs(c) do
    table.insert(toPlot,{symmath.export.SingleLine(value)})
end

gnuplot(toPlot)

