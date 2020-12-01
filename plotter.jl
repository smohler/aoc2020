using Plots
# define the Lorenz attractor
Base.@kwdef mutable struct Lorenz
    dt::Float64 = 0.02
    s::Float64 = 10
    a::Float64 = 28
    b::Float64 = 8/3
    x::Float64 = 1
    y::Float64 = 1
    z::Float64 = 1
end

function step!(l::Lorenz)
    dx = l.s * (l.y - l.x);         l.x += l.dt * dx
    dy = l.x * (l.a - l.z) - l.y;   l.y += l.dt * dy
    dz = l.x * l.y - l.b * l.z;     l.z += l.dt * dz
end

attractor = Lorenz()
#=
    This solution does not save any data but just steps thru time and plots it. 
    This is done by first defining the ODE system as a state vector along with 
    a time step and the Lorenz parameters. The function step takes in an attractor
    and then accesses all the fields in it. The "!" means that the function mutates 
    the state of the attractor. 
=#


# initialize a 3D plot with 1 empty series
plt = plot3d(
    1,
    xlim = (-30, 30),
    ylim = (-30, 30),
    zlim = (0, 60),
    title = "Lorenz Attractor",
    marker = 2,
)

# build an animated gif by pushing new points to the plot, saving every 10th frame
gif for i=1:1500
    step!(attractor)
    #now that step has been applied the attractor has been mutated so plot it. 
    #this idea of mutating a specific data structure is almost like a 
    #super power in programming.
    push!(plt, attractor.x, attractor.y, attractor.z)
end every 10
