#Author: Jarrett Melnick
#Program to list the top 10 numbers with the largest Collatz sequences in a given range.
function collatz(val)
    #Function to perform a Collatz sequence on a number and calculate the length of the sequence
    sequence = 1
    while(val > 2)
        if(val % 2 == 1)
            sequence = sequence+1
            val = (3*val+1)
        else
            sequence = sequence + 1
            val = (val >> 1)
        end
    end
    return sequence
end
function smallest(numArray)
    #Returns the index of the smallest value in array numArray
    mini = 1
    for i = 1:10
        if(numArray[i] < numArray[mini])
            mini = i
        end
    end
    return mini
end
function largest(numArray)
    #Returns the index of the largest value in array numArray
    maxi = 1
    for i = 1:10
        if(numArray[i] > numArray[maxi])
            maxi = i
        end
    end
    return maxi
end
function hasSequenceLen(numArray, val)
    #Returns true if the array numArray has the number val
    hasVal = false
    for i = 1:10
        if(numArray[i] == val)
            hasVal = true
        end
    end
    return hasVal
end
function printTable(numArrayI, numArrayS)
    for i = 1:10
        @printf "%d has a length of %d\n" numArrayI[i] numArrayS[i] 
    end
end

#Program logic:
print("Please input the max value to be considered: ")
iterate = readline()
iterate = parse(Int64, chomp(iterate))
identities = [0,0,0,0,0,0,0,0,0,0]
sequences = [0,0,0,0,0,0,0,0,0,0]

println("Calculating Sequences...")
for i = 2:iterate
    curCollatz = collatz(i)
    small = smallest(sequences)
    hasSequence = hasSequenceLen(sequences, curCollatz)
    if((curCollatz > sequences[small]) && !(hasSequence))
        sequences[small] = curCollatz
        identities[small] = i
    end
end
ident2 = copy(identities)
seq2 = copy(sequences)
println("SORTED BY SEQUENCE SIZE")
for i = 1:10
    large = largest(sequences)
    @printf "%d has a Collatz sequence of length %d\n" identities[large] sequences[large]
    identities[large] = 0
    sequences[large] = 0
end
println("SORTED BY INTEGER SIZE")
for i = 1:10
    large = largest(ident2)
    @printf "%d has a Collatz sequence of length %d\n" ident2[large] seq2[large]
    ident2[large] = 0
    seq2[large] = 0
end