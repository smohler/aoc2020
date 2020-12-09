#handheld gameboy for advent of code
module Handheld

struct Intrx
    #instruction code for computer
    opt::String
    val::Int
end

mutable struct Cpu
    acc:: Int           #accumulator value
    clk:: Int           #clock cycle count
    mem:: Array{Intrx}  #an ordered list of computer instructions
    pos:: Int           #position in memory 
    hlt:: Bool          #flag for program halting
end

function READ(instruction)::Intrx
    optcode, val=split(instruction, " ")
    val=parse(Int, val)
    return Intrx(optcode, val)
end

function LOAD(programfile)::Cpu
    #load the .txt program into memory
    MEM=[]
    open(programfile) do file
        for line in eachline(file)
            push!(MEM, READ(line))
        end
    end
    return Cpu(0,1,MEM,1,false)
end

function RUN(programfile)
    CPU = LOAD(programfile)

    while !CPU.hlt
        if CPU.pos>length(CPU.mem); CPU.hlt = true; return CPU; end

        instruction = CPU.mem[CPU.pos]
        # msg="step:: $step \t opt:: $opt \t val:: $val \t acc:: $acc"
        # println(msg)

        if instruction.opt == "nop"; CPU.pos += 1; end
        if instruction.opt == "acc"; CPU.pos += 1; CPU.acc += val; end
        if instruction.opt == "jmp"; CPU.pos += val; end
        if in(instruction, MEM); CPU.hlt = true; return CPU; end
        push!(MEM, step)
        CPU.clk += 1
    end
end
function DEBUG(program)
    PROGRAM=readlines(program)
    #brute force it
    nops=findall(x->x[1:3]=="nop", PROGRAM)
    jmps=findall(x->x[1:3]=="jmp", PROGRAM)
    for i in jmps
        debugged=readlines(program)
        debugged[i]="nop"*debugged[i][4:end]
        (acc, flag)=RUN(debugged)
        if flag; return acc; end
    end
    for i in nops
        debugged=readlines(program)
        debugged[i]="jmp"*debugged[i][4:end]
        (acc, flag)=RUN(debugged)
        if flag; return acc; end
    end
end 
end

