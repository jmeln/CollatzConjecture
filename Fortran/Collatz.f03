program Collatz
!author: jarrett melnick
!program to caluclate the top 10 values with the longest collatz sequences in a range
INTEGER(KIND=16)::curCollatz, iterate, i, iter
INTEGER(KIND=16), dimension(10):: identities, sequences, ident2, seq2    !Declares two arrays to hold identities and sequences
INTEGER(KIND=4)::small, large, large2
LOGICAL::hasSequenceValue      

!Change iterate to change the range of numbers considered.
iterate = 15
!Set the arrays to 0
do i = 1, 10
  identities(i) = 0
  sequences(i) = 0
enddo
PRINT *, "CALCULATING VALUES..."
do i = 2, iterate
  curCollatz = sequence(i)
  small = smallest(sequences)
  hasSequenceValue = hasCollatzSequence(sequences, curCollatz)
  if((curCollatz > sequences(small)))then
    if(.not.(hasSequenceValue))then
      sequences(small) = curCollatz
      identities(small) = i
    endif
  endif
enddo
PRINT *, "Compililng List..."
ident2 = identities
seq2 = sequences
PRINT *, "SORTED BY SEQUENCE LENGTH"
do i = 1, 10
  large = largest(sequences)
  PRINT *, identities(large), " has a sequence length of ", sequences(large)
  identities(large) = 0
  sequences(large) = 0
enddo
PRINT *, "SORTED BY INTEGER SIZE"
do i = 1, 10
  large = largest(ident2)
  PRINT *, ident2(large), " has a sequence length of ", seq2(large)
  ident2(large) = 0
  seq2(large) = 0
enddo
contains
subroutine printTable(numI, numS)
  !subroutine that prints an unsorted table
  integer(KIND=16), dimension(10)::numI, numS
  do i = 1, 10
    PRINT *,numI(i) ," ", numS(i)
  enddo
end subroutine printTable
function sequence(num)
  !Subroutine that finds the length of the collatz sequence for the given number
  INTEGER(kind=16)::sequence
  INTEGER(Kind=16), value:: num
  sequence = 0
  do while(num >= 2)
    if(MOD(num, 2) == 0) then
      num = (num/2)
      sequence = sequence+1
    else
      num = (3*num+1)
      sequence = sequence+1
    endif
  enddo
  return
end function sequence
function hasCollatzSequence(numS, val)
  !Function to see if the given number is in array numS
  INTEGER(KIND=16), dimension(10)::numS
  INTEGER(KIND=16):: val
  LOGICAL:: hasCollatzSequence

  do k = 1,10
    if(numS(k) == val) then
      hasCollatzSequence = .true.
    endif
  enddo
  return
end function hasCollatzSequence
function largest(numS)
  !Returns the index of the largest value in numS
  INTEGER(KIND=16), dimension(10)::numS
  INTEGER(KIND=4):: largest
  largest = 1
  do j = 1, 11
    do k = 1, 10
      if(numS(largest) .lt. numS(k)) then
        largest = k
      endif
    enddo
  enddo
  return
end function largest
function smallest(numS)
  !Returns the index of the smallest value in numS 
  INTEGER(KIND=16), dimension(10)::numS
  INTEGER(KIND=4):: smallest
  smallest = 1
  do j = 1, 11
    do k = 1, 10
      if(numS(smallest) .gt. numS(k)) then
        smallest = k
      endif
    enddo
  enddo
  return
end function smallest
end program Collatz