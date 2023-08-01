export qrH!

function qrH!(A::AbstractMatrix)
    """
    qrH!(A)
    
    Computes the Householder QR factorization so that no additional memory space is allocated beyond that already occupied by the full rank input matrix A.
    
    Computes : A = QR
    
    Where :
        - Q is an unitary matrix (it means Q*Q = I)
        - R is upper triangular
    
    The strategy used here is first to overwrite the coefficients of R in the upper triangle of A. Besides, Q is defined only by vⱼ = A[j:m,j] (i.e. the elements of the jᵗʰ column of A beneath the diagonal), but the issue is only j-m elements can still be stored within A. That is why, those A[j:m,j] are scaled so that vⱼ[1] = 1. As we now know this information, there are j-m elements remaining in vⱼ that can be stored in A.

    #### Input arguments

    * `A`: a full rank matrix of dimension m × n;

    #### Output arguments

    * `A`: a matrix of dimension m × n containing the coefficients of Q and R;
    """
    m, n = size(A)
    j = 1
        while (j <= n) & (j < m)
            #necessary quantities
            vj = view(A,j:m,j)
            Aⱼⱼ = vj[1]
            σj = my_sign(Aⱼⱼ)
            vj_norm = norm(vj)
            vj[1] += σj*vj_norm
            δj = vj'vj

            #applying Householder reflection
            for l=j:n
                β = (vj'view(A,j:m,l))
                β *= (2/δj)
                for k=j:m
                    A[k,l] -= β*A[k,j]
                end
            end
            #scaling vj
            vj ./= vj[1]
            #changing the diagonal term
            A[j,j] = -σj*vj_norm
            #going to next step
            j += 1
        end
    A
end