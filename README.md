# Project Description
A collection of zkSNARK circuits defined using [Circom](https://github.com/iden3/circom) for proving [divisibility properties](https://en.wikipedia.org/wiki/Divisibility_rule#Divisibility_rules_for_numbers_1%E2%80%9330) of arbitrary elements in $$\mathbb{Z}$$.

This was an educational project for me to learn how to define zkSNARK circuits using Circom. These circuits are for demonstrative purposes only.

# Circuits

Let $\alpha = a_n 10^n + \dots + a_1 10^1 + a_0 10^0$, where $a_i\in \set{0, 1, ..., 9}$, $n\in{\mathbb{N}_{0}}$. The following divisibility properties are defined in [circuits](/circuits):
| Property                   | Condition                                                       |
| -------------------------- | --------------------------------------------------------------- |
| $\alpha$ is divisible by 2 | $$a_0 \equiv 0 \pmod{2}$$                                         |
| $\alpha$ is divisible by 3 | $$\sum_{i=0}^{n}a_i \equiv 0 \pmod{3}$$                           |
| $\alpha$ is divisible by 4 | $$concat(a_1, a_0) \equiv 0 \pmod{4}$$                                    |
| $\alpha$ is divisible by 5 | $$2a_0 \equiv 0 \pmod{10}$$                                   |
| $\alpha$ is divisible by 6 | $$a_0 + 4\sum_{i=1}^{n}a_i \equiv 0 \pmod{6}$$                      |
| $\alpha$ is divisible by 7 | $$5a_0 + concat(a_n, a_{n-1}, \dots , a_{1}) \equiv 0 \pmod{7}$$ |
| $\alpha$ is divisible by 8 | $$concat(a_2, a_1, a_0) \equiv 0 \pmod{8}$$                             |
| $\alpha$ is divisible by 9 | $$\sum_{i=0}^{n}a_i \equiv 0 \pmod{9}$$                             |

where $concat(a_{i_1}, a_{i_2}, \dots , a_{i_j})$ is the (left-right) concatenation of $a_{i_1}, a_{i_2}, \dots, a_{i_j}$
