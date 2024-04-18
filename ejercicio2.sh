#/bin/bash

mostrarUsuarios() {
	echo "Mostrando todos los usuarios..."
	cut -d ":" -f 1,3 /etc/passwd
}

agregarUsuario() {
	echo "Creando nuevo usuario..."
	
	echo "Introduce el nombre de usuario:"
	read usuario
	echo "Introduce el nombre completo:"
	read nombreCompleto
	echo "Introduce una contraseña:"
	read password
	
	useradd -m -d "/home/$usuario" -G "$usuario" $nombreCompleto
	usermod -c "$nombreCompleto" $usuario
	passwd $password
}

while true: do
	echo "Script para gestion de Usuarios y Grupos"
	echo "1. Mostar todos los usuarios del sistema."
	echo "2. Mostrar todos los grupos del sistema."
	echo "3. Agregar un nuevo usuario al sistema."
	echo "4. Agregar un nuevo grupo al sistema."
	echo "5. Eliminar un usuario."
	echo "6. Elimitar un grupo."
	echo "7. Añadir un usuario a un grupo."
	echo "8. Eliminar un usuario de un grupo."
	echo "9. Salir"
	
	echo "Elige una opción:"
	read opcion
	
	case $opcion in
		1) mostrarUsuarios ;;
		2) mostrarGrupos ;;
		3) agregarUsuario ;;
		4) agregarGrupo ;;
		5) borrarUsuario ;;
		6) borrarGrupo ;;
		7) agregarUsuarioAGrupo ;;
		8) borrarUsuarioDeGrupo ;;
		9) salir ;;
