export my_sign, HouseholderReflection, splitH

function my_sign(x::Number)
    if x == 0.0
        return 1
    else return sign(x)
    end
end


function HouseholderReflection(u::AbstractVector)
    "La fonction suivante calcule la réflexion de Householder associée au vecteur u 

    La fonction prend en entrée un AbstractVector et renvoie une matrice de dimensions mxm
    où m est la longueur du vecteur d'entrée u
    "
    δ = u'u
    return (I - 2*u*u'/δ)
end

function splitH(A::AbstractMatrix, n1::Int)
    "La fonction suivante permet de séparer une matrice en deux blocs horizontaux :
    Le premier bloc possédant n₁ colonnes et le second (n - n₁)"

    return A[1:end, 1:n1], A[1:end, n1+1:end]
end