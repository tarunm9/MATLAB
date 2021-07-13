# Hidden Markov Models Mismatch Algorithm: When Viterbi does not Maximise Gammas

Given a sequence of observations v = (v1, v2, . . . , vT ), there is no unique way to recover the sequence of hidden states h = (h1, h2, . . . , hT ).
One can use Viterbi and find h achieving the maximum Pr(h | v). An alternative approach is to build h from component-wise maximums so that ht = arg maxs∈S Pr(Ht = s | v), t = 1, 2, . . . , T.
These methods do not have to return the same result.
