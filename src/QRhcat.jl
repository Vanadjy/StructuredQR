export QRhcat!

function QRhcat!(A1::AbstractMatrix, A2::AbstractMatrix)
    n1 = size(A1,2) #nombre de colonne du premier bloc
    m2, n2 = size(A2)

    qrH!(A1) #compute QR Householder on the first block of A : A1

    qtmul!(A1, A2) #compute Q' *A2

    Q1_orth_A2 = view(A2,n1+1:m2,1:n2) #Q1_orth_A2 = A[n1+1:end, n1+1:end]
    qrH!(Q1_orth_A2) #compute QR Householder on Q1_orth_A2 which is the second block of Q1*A2

    return A1, A2
end