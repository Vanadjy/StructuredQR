export CreateDiagBlock, QRblocdiag!

function CreateDiagBlock(nb_Matrix, m_max, n_max)
    A_vect = []
    m_vect = rand(1:m_max, nb_Matrix)
    n_vect = rand(1:n_max, nb_Matrix)
    for k = 1:nb_Matrix
        if m_vect[k]<n_vect[k] #ensures to always being in overdetermined cases
            (m_vect[k],n_vect[k]) = (n_vect[k],m_vect[k])
        end
        push!(A_vect, rand(m_vect[k],n_vect[k]))
    end
    m = sum(m_vect)
    n = sum(n_vect)
    return A_vect, m , n 
end

function QRblocdiag!(A_vect)
    for A in A_vect
        qrH!(A)
    end
end