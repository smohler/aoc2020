#handheld gameboy for advent of code
module Handheld
export READ, RUN, DEBUG
function READ(instruction)
    optcode, val=split(instruction, " ")
    val=parse(Int, val)
    return optcode, val
end
function RUN(PROGRAM)
    acc=0
    step=1
    cycle=0
    MEM=[]
    while cycle<1000
        if step>length(PROGRAM); return acc, true; end
        opt, val=READ(PROGRAM[step])
        # msg="step:: $step \t opt:: $opt \t val:: $val \t acc:: $acc"
        # println(msg)
        if opt=="nop"; step+=1; end
        if opt=="acc"; step+=1; acc+=val; end
        if opt=="jmp"; step+=val; end
        if in(step, MEM); println("INFINITE LOOP"); return acc, false; end
        push!(MEM, step)
        cycle+=1
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

