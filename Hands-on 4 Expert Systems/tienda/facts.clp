(deffacts ordenes-de-compra
   (orden-de-compra 
      (cliente-id 1) 
      (items 
         (smartphone (marca "sony") (modelo "Xperia1") (color "rojo") (precio 17000)) 
         (tarjeta-de-credito (banco "banamex") (tipo "visa") (fecha-expiracion "2024-06-01"))))
   (orden-de-compra 
      (cliente-id 2) 
      (items 
         (smartphone (marca "lg") (modelo "Wing") (color "negro") (precio 15000)) 
         (tarjeta-de-credito (banco "liverpool") (tipo "visa") (fecha-expiracion "2026-03-01"))))
   (orden-de-compra 
      (cliente-id 1) 
      (items 
         (smartphone (marca "sony") (modelo "Xperia1") (color "rojo") (precio 17000)) 
         (computadora (marca "apple") (modelo "MacBookPro") (color "plateado") (precio 30000)))))
(deffacts tarjetas
   (tarjeta-de-credito (banco "hsbc") (tipo "visa") (fecha-expiracion "2024-06-01"))
   (tarjeta-de-credito (banco "scotiabank") (tipo "visa") (fecha-expiracion "2026-03-01"))
   (tarjeta-de-credito (banco "citibanamex") (tipo "mastercard") (fecha-expiracion "2025-09-01"))
   (tarjeta-de-credito (banco "banorte") (tipo "visa") (fecha-expiracion "2023-11-01")))

(deffacts vales
   (vale (valor 100))
   (vale (valor 200))
   (vale (valor 300))
   (vale (valor 400)))