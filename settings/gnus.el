;; From https://koldfront.dk/text/gnus-email-tutorial.html, https://koldfront.dk/text/gnus-email-imap.html and https://koldfront.dk/text/gnus-email-gmail.html

;; TODO: set pass for password management https://www.reddit.com/r/emacs/comments/o4g7dv/can_i_integrate_pass_the_password_manager_into/?show=original

;; UPM mail config: https://www.upm.es/UPM/ServiciosTecnologicos/email/Alumnos/Ayuda/ConfiguracionClientes/DatosConfiguracion

;; No primary server
(setq gnus-select-method '(nnnil ""))

;; Get email and store in nnml
(setq gnus-secondary-select-methods '((nnml "")
				      (nnimap "imap.gmail.com")
				      (nnimap "correo.alumnos.upm.es")))


