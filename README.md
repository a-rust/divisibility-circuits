# Table of Contents
- [Table of Contents](#table-of-contents)
- [Project Description](#project-description)
  - [Circuit Templates](#circuit-templates)


# Project Description
This repository contains zkSNARK circuit templates for basic divisibility properties of arbitrary field elements. 
* This was an educational project for me to learn how to implement custom circuit templates using [Circom](https://github.com/iden3/circom)
* These templates have not been thoroughly tested, and should remain only as a demonstrative purpose to give some idea of basic primitives that can be proven 

## Circuit Templates

Check the `/circuits` folder for the source code of the following templates

- [x] Num2Digits - Given an input $n = a_n(10^n) + \dots + a_1(10^1) + a_0(10^0)$, output $[a_n, \dots, a_1, a_0]$

