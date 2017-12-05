program Collatz
!author: jarrett melnick
!program to caluclate the top 10 values with the longest collatz sequences in a range
INTEGER(KIND=16)::curCollatz, iterate, i, iter,z, counter
INTEGER(KIND=16), dimension(10):: identities, sequences    !Declares two arrays to hold identities and sequences
INTEGER(KIND=4)::small, large
LOGICAL::hasSequenceValue      

!Change iterate to change the range of numbers considered.
iterate = 15
do i = 1, 10
  identities(i) = 0
  sequences(i) = 0
enddo
PRINT *, "CALCULATING VALUES..."
do i = 2, iterate
  counter = 0
  curCollatz = sequence(i, counter)
  PRINT*, curCollatz
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
do i = 1, 10
  large = largest(sequences)
  PRINT *, identities(large), " has a collatz sequence of length ", sequences(large)
  identities(large) = 0
  sequences(large) = 0
enddo

contains
subroutine printTable(numI, numS)
  !subroutine that prints an unsorted table
  integer(KIND=16), dimension(10)::numI, numS
  do i = 1, 10
    PRINT *,numI(i) ," has a collatz sequence1 of length ", numS(i)
  enddo
end subroutine printTable
recursive integer function sequence(num, counter) result(val)
  !Subroutine that finds the length of the collatz sequence for the given number
  INTEGER(Kind=16), value:: num, counter
  if(num /= 1)then
    counter = counter + 1
    if(MOD(num, 2) == 1)then
      val = sequence((3*num+1), counter)
    else
      val = sequence((num/2), counter) 
    endif
  else
    val = counter
    return
  endif
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
