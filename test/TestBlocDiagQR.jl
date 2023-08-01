@testset begin
    nb_Matrix = 50
    m_max = 50
    n_max = 30

    A_vect, m, n = CreateDiagBlock(nb_Matrix, m_max, n_max)
    R_vect = deepcopy(A_vect)
    QRblocdiag!(R_vect)

    for k in eachindex(A_vect)
        F = qr(A_vect[k])

        m, n = size(R_vect[k])
        Q_H = QRebuild!(R_vect[k])

        @test norm(triu(R_vect[k][1:n,1:n]) - F.R) ≤ 1e-13
        @test norm(Q_H - F.Q) ≤ 1e-13
        @test norm(Q_H*triu(R_vect[k]) - A_vect[k]) ≤ 1e-13
    end
end