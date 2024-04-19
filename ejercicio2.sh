#/bin/bash

mostrarUsuarios() {
	echo "Mostrando todos los usuarios..."
	cut -d ':' -f 1 /etc/passwd
}

mostrarGrupos() {
	echo "Mostrando todos los grupos..."
	cut -d ':' -f 1 /etc/group
}

agregarUsuario() {
	echo "Creando nuevo usuario..."
	
	echo "Introduce el nombre de usuario:"
	read nombreUsuario
	echo "Introduce el nombre completo:"
	read nombreCompleto
	
	useradd -m -d "/home/$nombreUsuario" -G "$nombreUsuario" $nombreCompleto
	usermod -c "$nombreCompleto" $nombreUsuario
	passwd $nombreUsuario
}

agregarGrupo() {
	echo "Creando nuevo grupo..."
	
	echo "Introduce el nombre del grupo:"
	read nombreGrupo
	
	groupadd $nombreGrupo
}

borrarUsuario() {
	echo "Borrando un usuario..."
	
	echo "Introduce nombre de usuario a borrar:"
	read nombreUsuario
	
	userdel $nombreUsuario
}

borrarGrupo() {
	echo "Borrando un grupo..."
	
	echo "Introduce el nombre del grupo a borrar:"
	read nombreGrupo
	
	groupdel $nombreGrupo
}

agregarUsuarioAGrupo() {
	echo "Añadiendo usuario a un grupo..."
	
	echo "Introduce el nombre de usuario:"
	read nombreUsuario
	echo "Introduce el nombre del grupo:"
	read nombreGrupo
	
	usermod -aG $nombreGrupo $nombreUsuario
}

borrarUsuarioDeGrupo() {
	echo "Borrando usuario de un grupo..."
	
	echo "Introduce el nombre de usuario:"
	read nombreUsuario
	echo "Introduce el nombre del grupo:"
	read nombreGrupo
	
	deluser $nombreUsuario $nombreGrupo
}

while true; do
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
		9) exit ;;
	esac
done		
