## Tests of QR with horizontal concatenation 

## Overdetermined matrices ##
@testset begin
    m = 6
    n1 = 2
    n2 = 3
    n = n1 + n2

    A = rand(m ,n)
    A1, A2 = splitH(A, n1)
    B = deepcopy(A)
    F = qr(A)

    #=Q, R = QR_concat_h!(A, n1)
    @test norm(F.R - R[1:n1+n2,1:n1+n2]) <= 1e-13 #test of unicity of QR decomposition
    @test norm(F.Q - Q) <= 1e-13
    @test norm(Q*R - A) <= 1e-13 #tests if the decomposition is correct=#

    R_H = deepcopy(A)
    qrH!(R_H)
    Q_H = QRebuild!(R_H)
    @test norm(Q_H*B - qmul!(R_H, B)) <= 1e-13 #tests if the multiplication QB is correct
    @test norm(Q_H'B - qtmul!(R_H, B)) <= 1e-13 #tests if the multiplication Q*B is correct

    QRhcat!(A1, A2)
    R = RRebuildHcat(A1, A2)
    Q = QRebuildHcat(A1, A2)
    @test norm(F.R - R[1:n, 1:n]) <= 1e-14 #test of unicity of QR decomposition
    @test norm(F.Q - Q) <= 1e-13
    @test norm(A - Q*R) <= 1e-13 #tests if the decomposition is correct
end

## Square matrices ##
@testset begin
    m = 6
    n1 = 3
    n2 = 3
    n = n1 + n2

    A = rand(m ,n)
    A1, A2 = splitH(A, n1)
    B = deepcopy(A)
    F = qr(A)

    #=Q, R = QR_concat_h!(A, n1)
    @test norm(F.R - R[1:n1+n2,1:n1+n2]) <= 1e-14 #test of unicity of QR decomposition
    @test norm(F.Q - Q) <= 1e-13
    @test norm(Q*R - A) <= 1e-13 #tests if the decomposition is correct=#

    R_H = deepcopy(A)
    qrH!(R_H)
    Q_H = QRebuild!(R_H)
    #@test norm(Q_H*B - mult_Q_B!(R_H, B)) <= 1e-13 #tests if the multiplication QB is correct
    @test norm(Q_H'B - qtmul!(R_H, B)) <= 1e-13 #tests if the multiplication Q*B is correct

    QRhcat!(A1, A2)
    R = RRebuildHcat(A1, A2)
    Q = QRebuildHcat(A1, A2)
    @test norm(F.R - R[1:n, 1:n]) <= 1e-13 #test of unicity of QR decomposition
    @test norm(F.Q - Q) <= 1e-13
    @test norm(A - Q*R) <= 1e-13 #tests if the decomposition is correct
end