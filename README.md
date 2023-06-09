# Table of Contents
- [Table of Contents](#table-of-contents)
  - [Project Description](#project-description)
  - [Circuit Templates](#circuit-templates)
  - [Divisibility Properties](#divisibility-properties)


## Project Description
This repository contains zkSNARK circuit templates for basic divisibility properties of arbitrary field elements
* This was an educational project for me to learn how to implement custom circuit templates using [Circom](https://github.com/iden3/circom)

Disclaimer: the circuit templates found in this repository have not been thoroughly tested, and should only remain for demonstrative purposes.


## Circuit Templates

Check the `/circuits` folder for the source code of the following templates

- [x] Num2Digits
- [x] Digits2Num
- [x] Num2FirstNMinus1
- [x] IsDivisibleBy2 
- [x] IsDivisibleBy3
- [x] IsDivisibleBy4
- [x] IsDivisibleBy5
- [x] IsDivisibleBy6
- [x] IsDivisibleBy7
- [x] IsDivisibleBy8
- [x] IsDivisibleBy9


## Divisibility Properties
In the ring of integers, there are many [divisibility properties](https://en.wikipedia.org/wiki/Divisibility_rule#Divisibility_rules_for_numbers_1%E2%80%9330)
* These properties hold not only in the ring of integers, but also in prime fields

Consider a prime field element $\alpha = a_n10^n + \dots + a_110^1 + a_010^0$, where $a_i\in[0..9]$. The divisibility properties used in these templates are as follows:  
| Property                   | Condition                                                       |
| -------------------------- | --------------------------------------------------------------- |
| $\alpha$ is divisible by 2 | $$a_0 \equiv 0 \mod 2$$                                         |
| $\alpha$ is divisible by 3 | $$\sum_{i=0}^{n}a_i \equiv 0 \mod 3$$                           |
| $\alpha$ is divisible by 4 | $$concat_2(a_1, a_0) \equiv 0 \mod 4$$                                    |
| $\alpha$ is divisible by 5 | $$2a_0 \equiv 0 \mod 10$$                                   |
| $\alpha$ is divisible by 6 | $$a_0 + 4\sum_{i=1}^{n}a_i \equiv 0 \mod 6$$                      |
| $\alpha$ is divisible by 7 | $$5a_0 + concat_{n}(a_n, a_{n-1}, \dots , a_{1}) \equiv 0 \mod 7$$ |
| $\alpha$ is divisible by 8 | $$concat_3(a_2, a_1, a_0) \equiv 0 \mod 8$$                             |
| $\alpha$ is divisible by 9 | $$\sum_{i=0}^{n}a_i \equiv 0 \mod 9$$                             |

where $concat_j(a_{i_1}, a_{i_2}, \dots , a_{i_j})$ is the (left-right) concatenation of $a_{i_1}, a_{i_2}, \dots, a_{i_j}$.
