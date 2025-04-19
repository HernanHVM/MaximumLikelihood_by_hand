# ML algoritmo de poda con el modelo Mk, corregido en clase 3/marzo/2025
# escrito por Hernán Vázquez miranda @HernanHVM
# This work is licensed under a Creative Commons Attribution 3.0 International License.

#install.packages("expm")
library(expm)

# matriz Q para el modelo Mk (Lewis 2001)
Qmat1 <- Matrix::Matrix(c(-1,1,1,-1), ncol = 2)
v1 <- 1.0 # rama izquierda descendiente del nodo n1
Pmat1 <- expm(Qmat1*v1)
Pmat1

#         <3[,1]     :)[,2]
#<3[1,] 0.5676676 0.4323324
#:)[2,] 0.4323324 0.5676676



# Algoritmo poda ML 
# estado <3 LP(0)=(∑x∈kPr(x|0,tL=1.0)LL(x))*(∑x∈kPr(x|0,tR=1.0)LR(x))
# estado :) LP(1)=(∑x∈kPr(x|1,tL=1.0)LL(x))*(∑x∈kPr(x|1,tR=1.0)LR(x))

### caracter c1
# Estado <3 en nodo n1
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
0.567*1+0.432*0 # = 0.567
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
0.567*1+0.432*0 # = 0.567
# L(<3)= ML del estado <3 
0.567*0.567 # = 0.32

# Estado :) en nodo n1
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
0.567*0+0.432*1 # = 0.432
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
0.567*0+0.432*1 # = 0.432
#L(:))= ML del estado :)
0.432*0.432 # = 0.18

# Estado <3 en nodo n2
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
0.567*0+0.432*1 # = 0.432
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
0.567*0+0.432*1 # = 0.432
#L(:))= ML del estado :)
0.432*0.432 # = 0.18

# Estado :) en nodo n2, matrices Pmat3 y Pmat4
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
0.567*1+0.432*0 # = 0.567
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
0.567*1+0.432*0 # = 0.567
# L(<3)= ML del estado <3 
0.567*0.567 # = 0.32

# Estado <3 en nodo n3
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
0.567*0.32+0.432*0.18 # = 0.2592
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
0.567*0.32+0.432*0.18 # = 0.2592
# L(<3)= ML del estado <3 
0.2592*0.2592 # = 0.0671

# Estado :) en nodo n3, matrices Pmat5 y Pmat6
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
0.567*0.18+0.432*0.32 # = 0.2403
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
0.567*0.18+0.432*0.32 # = 0.2403
# L(:))= ML del estado :) 
0.2403*0.2403 # = 0.0577

# ML del nodo n3 en la raíz
# L=∑x∈k πxLraíz(x) = suma de las frecuencias de cada estado * L del estado
# frec <3 * L <3 + frec :) * L :)
# frec <3 = 0.4375
# frec :) = 0.5625
0.5*0.0671 + 0.5*0.0577 # = 
0.0624 # = 
# convertido a LnL 
log(0.0624) # = -2.77419

### caracter c3
# Estado <3 en nodo n1
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
0.567*1+0.432*0 # = 0.567
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
0.567*0+0.432*1 # = 0.432
# L(<3)= ML del estado <3 
0.567*0.432 # = 0.2449

# Estado :) en nodo n1
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
0.567*0+0.432*1 # = 0.432
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
0.567*0+0.432*1 # = 0.432
#L(:))= ML del estado :)
0.432*0.432 # = 0.18

# Estado <3 en nodo n2
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
0.567*0+0.432*1 # = 0.432
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
0.567*0+0.432*1 # = 0.432
#L(:))= ML del estado :)
0.432*0.432 # = 0.18

# Estado :) en nodo n2
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
0.567*1+0.432*0 # = 0.567
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
0.567*1+0.432*0 # = 0.567
# L(<3)= ML del estado <3 
0.567*0.567 # = 0.32

# Estado <3 en nodo n3
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
0.567*0.2449+0.432*0.18 # = 0.2166
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
0.567*0.2449+0.432*0.18 # = 0.2166
# L(<3)= ML del estado <3 
0.2166*0.2166 # = 0.0469

# Estado :) en nodo n3
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
0.567*0.18+0.432*0.32 # = 0.2403
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
0.567*0.18+0.432*0.32 # = 0.2403
# L(:))= ML del estado :) 
0.2403*0.2403 # = 0.0577

# El nodo n3 en la raíz
# L=∑x∈k πxLraíz(x) = suma de las frecuencias de cada estado * L del estado
# frec <3 * L <3 + frec :) * L :)
# frec <3 = 0.4375
# frec :) = 0.5625
0.5*0.0469 + 0.5*0.0577 # = 
0.0523 # = 
# convertido a LnL 
log(0.0523) # = -2.950759

### caracter c8
# Estado <3 en nodo n1
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
0.567*1+0.432*0 # = 0.567
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
0.567*0+0.432*1 # = 0.432
# L(<3)= ML del estado <3 
0.567*0.432 # = 0.2449

# Estado :) en nodo n1
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
0.567*0+0.432*1 # = 0.432
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
0.567*0+0.432*1 # = 0.432
#L(:))= ML del estado :)
0.432*0.432 # = 0.18

# Estado <3 en nodo n2
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
0.567*1+0.432*0 # = 0.567
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
0.567*0+0.432*1 # = 0.432
#L(:))= ML del estado :)
0.567*0.432 # = 0.2449

# Estado :) en nodo n2
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
0.567*1+0.432*0 # = 0.567
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
0.567*1+0.432*0 # = 0.567
# L(<3)= ML del estado <3 
0.567*0.567 # = 0.32

# Estado <3 en nodo n3
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
0.567*0.32+0.432*0.18 # = 0.2592
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
0.567*0.32+0.432*0.18 # = 0.2592
# L(<3)= ML del estado <3 
0.2592*0.2592 # = 0.0671

# Estado :) en nodo n3
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
0.567*0.2449+0.432*0.32 # = 0.2771
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
0.567*0.2449+0.432*0.32 # = 0.2771
# L(:))= ML del estado :) 
0.2771*0.2771 # = 0.0768

# El nodo n3 en la raíz
# L=∑x∈k πxLraíz(x) = suma de las frecuencias de cada estado * L del estado
# frec <3 * L <3 + frec :) * L :)
# frec <3 = 0.4375
# frec :) = 0.5625
0.5*0.0671 + 0.5*0.0768 # = 
0.07195 # = 
# convertido a LnL 
log(0.07195) # = -2.631784

# multiplicamos las L de cada caracter
# hay 4 columnas como c1, 3 columnas como c3 y 1 columna como c8
# como el c1^4, c3^3 y c8^1
(0.0624^4)*(0.0523^3)*(0.07195^1) # = 0.0000000001560538
log(0.0000000001560538) # = -22.58082

#######################################################
#######################
####Algoritmo de polea

# matriz Q para el modelo Mk (Lewis 2001)
Qmat1 <- Matrix::Matrix(c(-1,1,1,-1), ncol = 2)
v1 <- 1.0
Pmat1 <- expm(Qmat1*v1)
Pmat1

#         <3[,1]     :)[,2]
#<3[1,] 0.5676676 0.4323324
#:)[2,] 0.4323324 0.5676676

v2 <- 1.0 # rama derecha descendiente del nodo n1
Pmat2 <- expm(Qmat1*v2)
Pmat2

v3 <- 1.0 # rama izquierda descendiente del nodo n2
Pmat3 <- expm(Qmat1*v3)
Pmat3

v4 <- 1.0 # rama derecha descendiente del nodo n2
Pmat4 <- expm(Qmat1*v4)
Pmat4

v5 <- 1.0 # rama izquierda descendiente del nodo n2
Pmat5 <- expm(Qmat1*v5)
Pmat5

v6 <- 1.0 # rama derecha descendiente del nodo n2
Pmat6 <- expm(Qmat1*v6)
Pmat6

### caracter c1
# Estado <3 en nodo n1, matrices Pmat1 y Pmat2
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
Pmat1[1,1]*1+Pmat1[1,2]*0 # = 0.567
c1_e_i_corazon_n1 <- Pmat1[1,1]*1+Pmat1[1,2]*0
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
Pmat2[1,1]*1+Pmat2[1,2]*0 # = 0.567
c1_e_d_corazon_n1 <- Pmat2[1,1]*1+Pmat2[1,2]*0
# L(<3)= ML del estado <3 
0.567*0.567 # = 0.32
c1_e_i_corazon_n1*c1_e_d_corazon_n1
P_c1_corazon_corazon_n1 <- c1_e_i_corazon_n1*c1_e_d_corazon_n1
P_c1_corazon_corazon_n1

# Estado :) en nodo n1, matrices Pmat1 y Pmat2
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
Pmat1[1,1]*0+Pmat1[1,2]*1 # = 0.432
c1_e_i_sonrisa_n1 <- Pmat1[1,1]*0+Pmat1[1,2]*1
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
Pmat2[1,1]*0+Pmat2[1,2]*1 # = 0.432
c1_e_d_sonrisa_n1 <- Pmat2[1,1]*0+Pmat2[1,2]*1
#L(:))= ML del estado :)
0.432*0.432 # = 0.18
c1_e_i_sonrisa_n1*c1_e_d_sonrisa_n1
P_c1_sonrisa_sonrisa_n1 <- c1_e_i_sonrisa_n1*c1_e_d_sonrisa_n1
P_c1_sonrisa_sonrisa_n1

# Estado <3 en nodo n2, matrices Pmat3 y Pmat4
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
Pmat3[1,1]*0+Pmat3[1,2]*1 # = 0.432
c1_e_i_corazon_n2 <- Pmat3[1,1]*0+Pmat3[1,2]*1
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
Pmat4[1,1]*0+Pmat4[1,2]*1 # = 0.432
c1_e_d_sonrisa_n2 <- Pmat4[1,1]*0+Pmat4[1,2]*1
#L(:))= ML del estado :)
0.432*0.432 # = 0.18
c1_e_i_corazon_n2*c1_e_d_sonrisa_n2
P_c1_corazon_sonrisa_n2 <- c1_e_i_corazon_n2*c1_e_d_sonrisa_n2
P_c1_corazon_sonrisa_n2

# Estado :) en nodo n2, matrices Pmat3 y Pmat4
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
Pmat3[1,1]*1+Pmat3[1,2]*0 # = 0.567
c1_e_i_sonrisa_n2 <- Pmat3[1,1]*1+Pmat3[1,2]*0
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
Pmat4[1,1]*1+Pmat4[1,2]*0 # = 0.567
c1_e_d_sonrisa_n2 <- Pmat4[1,1]*1+Pmat4[1,2]*0
# L(<3)= ML del estado <3 
c1_e_i_sonrisa_n2*c1_e_d_sonrisa_n2 # = 0.32
P_c1_sonrisa_sonrisa_n2 <- c1_e_i_sonrisa_n2*c1_e_d_sonrisa_n2
P_c1_sonrisa_sonrisa_n2

# Estado <3 en nodo n3, matrices Pmat5 y Pmat6
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
Pmat5[1,1]*P_c1_corazon_corazon_n1+Pmat5[1,2]*P_c1_corazon_sonrisa_n2 # = 0.2592
c1_e_i_corazon_n3 <- Pmat5[1,1]*P_c1_corazon_corazon_n1+Pmat5[1,2]*P_c1_corazon_sonrisa_n2
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
Pmat6[1,1]*P_c1_corazon_corazon_n1+Pmat6[1,2]*P_c1_corazon_sonrisa_n2 # = 0.2592
c1_e_d_corazon_n3 <- Pmat6[1,1]*P_c1_corazon_corazon_n1+Pmat6[1,2]*P_c1_corazon_sonrisa_n2
# L(<3)= ML del estado <3 
c1_e_i_corazon_n3*c1_e_d_corazon_n3 # = 0.0671
P_c1_corazon_corazon_n3 <- c1_e_i_corazon_n3*c1_e_d_corazon_n3
P_c1_corazon_corazon_n3

# Estado :) en nodo n3, matrices Pmat5 y Pmat6
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
Pmat5[1,1]*P_c1_sonrisa_sonrisa_n1+Pmat5[1,2]*P_c1_sonrisa_sonrisa_n2 # = 0.2403
c1_e_i_sonrisa_n3 <- Pmat5[1,1]*P_c1_sonrisa_sonrisa_n1+Pmat5[1,2]*P_c1_sonrisa_sonrisa_n2
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
Pmat6[1,1]*P_c1_sonrisa_sonrisa_n1+Pmat6[1,2]*P_c1_sonrisa_sonrisa_n2 # = 0.2403
c1_e_d_sonrisa_n3 <- Pmat6[1,1]*P_c1_sonrisa_sonrisa_n1+Pmat6[1,2]*P_c1_sonrisa_sonrisa_n2
# L(:))= ML del estado :) 
c1_e_i_sonrisa_n3*c1_e_d_sonrisa_n3 # = 0.0577
P_c1_sonrisa_sonrisa_n3 <- c1_e_i_sonrisa_n3*c1_e_d_sonrisa_n3
P_c1_sonrisa_sonrisa_n3

# ML del nodo n3 en la raíz
# L=∑x∈k πxLraíz(x) = suma de las frecuencias de cada estado * L del estado
# frec <3 * L <3 + frec :) * L :)
# frec <3 = 0.4375
# frec :) = 0.5625
0.4375*P_c1_corazon_corazon_n3 + 0.5625*P_c1_sonrisa_sonrisa_n3 # = 
# 0.0619 # = 
P_c1_corazon_sonrisa_n3 <- 0.4375*P_c1_corazon_corazon_n3 + 0.5625*P_c1_sonrisa_sonrisa_n3
P_c1_corazon_sonrisa_n3
# convertido a LnL 
log(P_c1_corazon_sonrisa_n3) # = -2.744

### caracter c3
# Estado <3 en nodo n1, matrices Pmat1 y Pmat2
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
Pmat1[1,1]*1+Pmat1[1,2]*0 # = 0.567
c3_e_i_corazon_n1 <- Pmat1[1,1]*1+Pmat1[1,2]*0
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
Pmat2[1,1]*0+Pmat2[1,2]*1 # = 0.432
c3_e_d_corazon_n1 <- Pmat2[1,1]*0+Pmat2[1,2]*1
# L(<3)= ML del estado <3 
c3_e_i_corazon_n1*c3_e_d_corazon_n1 # = 0.2449
P_c3_corazon_corazon_n1 <- c3_e_i_corazon_n1*c3_e_d_corazon_n1
P_c3_corazon_corazon_n1

# Estado :) en nodo n1, matrices Pmat1 y Pmat2
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
Pmat1[1,1]*0+Pmat1[1,2]*1 # = 0.432
c3_e_i_sonrisa_n1 <- Pmat1[1,1]*0+Pmat1[1,2]*1
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
Pmat2[1,1]*0+Pmat2[1,2]*1 # = 0.432
c3_e_d_sonrisa_n1 <- Pmat2[1,1]*0+Pmat2[1,2]*1
#L(:))= ML del estado :)
c3_e_i_sonrisa_n1*c3_e_d_sonrisa_n1 # = 0.18
P_c3_sonrisa_sonrisa_n1 <- c3_e_i_sonrisa_n1*c3_e_d_sonrisa_n1
P_c3_sonrisa_sonrisa_n1

# Estado <3 en nodo n2, matrices Pmat3 y Pmat4
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
Pmat3[1,1]*0+Pmat3[1,2]*1 # = 0.432
c3_e_i_corazon_n2 <- Pmat3[1,1]*0+Pmat3[1,2]*1
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
Pmat4[1,1]*0+Pmat4[1,2]*1 # = 0.432
c3_e_d_corazon_n2 <- Pmat4[1,1]*0+Pmat4[1,2]*1
#L(:))= ML del estado :)
c3_e_i_corazon_n2*c3_e_d_corazon_n2 # = 0.18
P_c3_corazon_corazon_n2 <- c3_e_i_corazon_n2*c3_e_d_corazon_n2
P_c3_corazon_corazon_n2

# Estado :) en nodo n2, matrices Pmat3 y Pmat4
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
Pmat3[1,1]*1+Pmat3[1,2]*0 # = 0.567
c3_e_i_sonrisa_n2 <- Pmat3[1,1]*1+Pmat3[1,2]*0
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
Pmat4[1,1]*1+Pmat4[1,2]*0 # = 0.567
c3_e_d_sonrisa_n2 <- Pmat4[1,1]*1+Pmat4[1,2]*0
# L(<3)= ML del estado <3 
c3_e_i_sonrisa_n2*c3_e_d_sonrisa_n2 # = 0.32
P_c3_sonrisa_sonrisa_n2 <- c3_e_i_sonrisa_n2*c3_e_d_sonrisa_n2
P_c3_sonrisa_sonrisa_n2

# Estado <3 en nodo n3, matrices Pmat5 y Pmat6
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
Pmat5[1,1]*P_c3_corazon_corazon_n1+Pmat5[1,2]*P_c3_corazon_corazon_n2 # = 0.2166
c3_e_i_corazon_n3 <- Pmat5[1,1]*P_c3_corazon_corazon_n1+Pmat5[1,2]*P_c3_corazon_corazon_n2
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
Pmat6[1,1]*P_c3_corazon_corazon_n1+Pmat6[1,2]*P_c3_corazon_corazon_n2 # = 0.2166
c3_e_d_corazon_n3 <- Pmat6[1,1]*P_c3_corazon_corazon_n1+Pmat6[1,2]*P_c3_corazon_corazon_n2
# L(<3)= ML del estado <3 
c3_e_i_corazon_n3*c3_e_d_corazon_n3 # = 0.0469
P_c3_corazon_corazon_n3 <- c3_e_i_corazon_n3*c3_e_d_corazon_n3
P_c3_corazon_corazon_n3

# Estado :) en nodo n3, matrices Pmat5 y Pmat6
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
Pmat5[1,1]*P_c3_sonrisa_sonrisa_n1+Pmat5[1,2]*P_c3_sonrisa_sonrisa_n2 # = 0.2403
c3_e_i_sonrisa_n3 <- Pmat5[1,1]*P_c3_sonrisa_sonrisa_n1+Pmat5[1,2]*P_c3_sonrisa_sonrisa_n2
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
Pmat6[1,1]*P_c3_sonrisa_sonrisa_n1+Pmat6[1,2]*P_c3_sonrisa_sonrisa_n2 # = 0.2403
c3_e_d_sonrisa_n3 <- Pmat6[1,1]*P_c3_sonrisa_sonrisa_n1+Pmat6[1,2]*P_c3_sonrisa_sonrisa_n2
# L(:))= ML del estado :) 
c3_e_i_sonrisa_n3*c3_e_d_sonrisa_n3 # = 0.0577
P_c3_sonrisa_sonrisa_n3 <- c3_e_i_sonrisa_n3*c3_e_d_sonrisa_n3
P_c3_sonrisa_sonrisa_n3

# El nodo n3 en la raíz
# L=∑x∈k πxLraíz(x) = suma de las frecuencias de cada estado * L del estado
# frec <3 * L <3 + frec :) * L :)
# frec <3 = 0.4375
# frec :) = 0.5625
0.4375*P_c3_corazon_corazon_n3 + 0.5625*P_c3_sonrisa_sonrisa_n3 # = 
P_c3_corazon_sonrisa_n3 <- 0.4375*P_c3_corazon_corazon_n3 + 0.5625*P_c3_sonrisa_sonrisa_n3
P_c3_corazon_sonrisa_n3
#0.0531 # = 
# convertido a LnL 
log(P_c3_corazon_sonrisa_n3) # = -2.898

### caracter c8
# Estado <3 en nodo n1, matrices Pmat1 y Pmat2
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
Pmat1[1,1]*1+Pmat1[1,2]*0 # = 0.567
c8_e_i_corazon_n1 <- Pmat1[1,1]*1+Pmat1[1,2]*0
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
Pmat2[1,1]*0+Pmat2[1,2]*1 # = 0.432
c8_e_d_corazon_n1 <- Pmat2[1,1]*0+Pmat2[1,2]*1
# L(<3)= ML del estado <3 
c8_e_i_corazon_n1*c8_e_d_corazon_n1 # = 0.2449
P_c8_corazon_corazon_n1 <- c8_e_i_corazon_n1*c8_e_d_corazon_n1
P_c8_corazon_corazon_n1

# Estado :) en nodo n1, matrices Pmat1 y Pmat2
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
Pmat1[1,1]*0+Pmat1[1,2]*1 # = 0.432
c8_e_i_sonrisa_n1 <- Pmat1[1,1]*0+Pmat1[1,2]*1
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
Pmat2[1,1]*0+Pmat2[1,2]*1 # = 0.432
c8_e_d_sonrisa_n1 <- Pmat2[1,1]*0+Pmat2[1,2]*1
#L(:))= ML del estado :)
c8_e_i_sonrisa_n1*c8_e_d_sonrisa_n1 # = 0.18
P_c8_sonrisa_sonrisa_n1 <- c8_e_i_sonrisa_n1*c8_e_d_sonrisa_n1
P_c8_sonrisa_sonrisa_n1

# Estado <3 en nodo n2, matrices Pmat3 y Pmat4
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
Pmat3[1,1]*1+Pmat3[1,2]*0 # = 0.567
c8_e_i_corazon_n2 <- Pmat3[1,1]*1+Pmat3[1,2]*0
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
Pmat4[1,1]*0+Pmat4[1,2]*1 # = 0.432
c8_e_d_corazon_n2 <- Pmat4[1,1]*0+Pmat4[1,2]*1
#L(<3)= ML del estado <3
c8_e_i_corazon_n2*c8_e_d_corazon_n2 # = 0.2449
P_c8_corazon_corazon_n2 <- c8_e_i_corazon_n2*c8_e_d_corazon_n2
P_c8_corazon_corazon_n2

# Estado :) en nodo n2, matrices Pmat3 y Pmat4
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
Pmat3[1,1]*1+Pmat3[1,2]*0 # = 0.567
c8_e_i_sonrisa_n2 <- Pmat3[1,1]*1+Pmat3[1,2]*0
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
Pmat4[1,1]*1+Pmat4[1,2]*0 # = 0.567
c8_e_d_sonrisa_n2 <- Pmat4[1,1]*1+Pmat4[1,2]*0
# L(:))= ML del estado :) 
c8_e_i_sonrisa_n2*c8_e_d_sonrisa_n2 # = 0.32
P_c8_sonrisa_sonrisa_n2 <- c8_e_i_sonrisa_n2*c8_e_d_sonrisa_n2
P_c8_sonrisa_sonrisa_n2

# Estado <3 en nodo n3, matrices Pmat5 y Pmat6
# hija/lado izquierda ∑x∈kPr(x|<3,tL=1.0)LL(x)= 
Pmat5[1,1]*P_c8_corazon_corazon_n1+Pmat5[1,2]*P_c8_corazon_corazon_n2 # = 0.2201
c8_e_i_corazon_corazon_n3 <- Pmat5[1,1]*P_c8_corazon_corazon_n1+Pmat5[1,2]*P_c8_corazon_corazon_n1
# hija/lado derecha ∑x∈kPr(x|<3,tR=1.0)LR(x)= 
Pmat6[1,1]*P_c8_corazon_corazon_n1+Pmat6[1,2]*P_c8_corazon_corazon_n2 # = 0.2786
c8_e_d_corazon_corazon_n3 <- Pmat6[1,1]*P_c8_corazon_corazon_n2+Pmat6[1,2]*P_c8_corazon_corazon_n2
# L(<3)= ML de estado <3
c8_e_i_corazon_corazon_n3*c8_e_d_corazon_corazon_n3 # = 0.0613
P_c8_corazon_corazon_n3 <- c8_e_i_corazon_corazon_n3*c8_e_d_corazon_corazon_n3
P_c8_corazon_corazon_n3

# Estado :) en nodo n3, matrices Pmat5 y Pmat6
# hija/lado izquierda ∑x∈kPr(x|:),tL=1.0)LL(x)=
Pmat5[1,1]*P_c8_sonrisa_sonrisa_n1+Pmat5[1,2]*P_c8_sonrisa_sonrisa_n2 # = 0.2771
c8_e_i_sonrisa_sonrisa_n3 <- Pmat5[1,1]*P_c8_sonrisa_sonrisa_n1+Pmat5[1,2]*P_c8_sonrisa_sonrisa_n2
# hija/lado derecha ∑x∈kPr(x|:),tR=1.0)LR(x)=
Pmat6[1,1]*P_c8_sonrisa_sonrisa_n1+Pmat6[1,2]*P_c8_sonrisa_sonrisa_n2 # = 0.2890
c8_e_d_sonrisa_sonrisa_n3 <- Pmat6[1,1]*P_c8_sonrisa_sonrisa_n1+Pmat6[1,2]*P_c8_sonrisa_sonrisa_n1
# L(:))= ML del estado :) 
c8_e_i_sonrisa_sonrisa_n3*c8_e_d_sonrisa_sonrisa_n3 # = 0.0458
P_c8_sonrisa_sonrisa_n3 <- c8_e_i_sonrisa_sonrisa_n3*c8_e_d_sonrisa_sonrisa_n3
P_c8_sonrisa_sonrisa_n3

# El nodo n3 en la raíz
# L=∑x∈k πxLraíz(x) = suma de las frecuencias de cada estado * L del estado
# frec <3 * L <3 + frec :) * L :)
# frec <3 = 0.4375
# frec :) = 0.5625
0.4375*P_c8_corazon_corazon_n3 + 0.5525*P_c8_sonrisa_sonrisa_n3 # = 
P_c8_corazon_sonrisa_n3 <- 0.4375*P_c8_corazon_corazon_n3 + 0.5525*P_c8_sonrisa_sonrisa_n3
P_c8_corazon_sonrisa_n3
#0.0465 # = 
# convertido a LnL 
log(P_c8_corazon_sonrisa_n3) # = -2.8989

# multiplicamos las L de cada caracter
# hay 4 columnas como c1, 3 columnas como c3 y 1 columna como c8
# como el c1^4, c3^3 y c8^1
(P_c1_corazon_sonrisa_n3^4)*(P_c3_corazon_sonrisa_n3^3)*(P_c3_corazon_sonrisa_n3^1) # = 1.221703e-10
log((P_c1_corazon_sonrisa_n3^4)*(P_c3_corazon_sonrisa_n3^3)*(P_c8_corazon_sonrisa_n3^1)) # = -22.82561

# LnL todas las ramas 1.0
#-22.82561

## Polea, cambiar la longitud de las ramas v
v1 <- 0.01
Pmat1 <- expm(Qmat1*v1)
Pmat1

# LnL rama v1 = 0.5,  todas las ramas 1.0
#-22.99925

v2 <- 14.0 # rama derecha descendiente del nodo n1
Pmat2 <- expm(Qmat1*v2)
Pmat2