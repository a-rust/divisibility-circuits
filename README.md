# Table of Contents
- [Table of Contents](#table-of-contents)
- [Project Description](#project-description)
  - [Circuit Templates](#circuit-templates)


# Project Description
This repository contains zkSNARK circuit templates for basic divisibility properties of arbitrary field elements. This was an educational project for me to learn how to implement custom circuit templates using [Circom](https://github.com/iden3/circom). 

**These circuits have not been tested, and should not be used in any production-level projects.**

## Circuit Templates

Check the `/circuits` folder for the source code of the following templates

- [x] Num2PowersOf10 - Given an input $n = a_n(10^n) + \dots + a_1(10^1) + a_0(10^0)$, output $[a_n, \dots, a_1, a_0]$
- [ ] IsDivisibleBy2 

Check out the [divisibility rules](https://en.wikipedia.org/wiki/Divisibility_rule) for reference
* Note that these divisibility rules work for both the ring of integers, and for prime fields. Thus, these divisibility rules can be enforced using zkSNARKs.

