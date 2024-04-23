#/bin/bash

mostrarUsuarios() {
	echo "Mostrando todos los usuarios..."
	cut -d ':' -f 1 /etc/passwd
	
	echo "---------------------------------------"
}

mostrarGrupos() {
	echo "Mostrando todos los grupos..."
	cut -d ':' -f 1 /etc/group
	
	echo "---------------------------------------"
}

agregarUsuario() {
	echo "Creando nuevo usuario..."
	
	echo "Introduce el nombre de usuario:"
	read nombreUsuario
	echo "Introduce el nombre completo:"
	read nombreCompleto
	
	useradd $nombreUsuario
	usermod -c "$nombreCompleto" $nombreUsuario
	passwd $nombreUsuario
	
	echo "---------------------------------------"
	echo "El usuario $nombreUsuario ha sido creado."
	echo "---------------------------------------"
}

agregarGrupo() {
	echo "Creando nuevo grupo..."
	
	echo "Introduce el nombre del grupo:"
	read nombreGrupo
	
	groupadd $nombreGrupo
		
	echo "---------------------------------------"
	echo "El grupo $nombreGrupo ha sido creado."
	echo "---------------------------------------"
}

borrarUsuario() {
	echo "Borrando un usuario..."
	
	echo "Introduce nombre de usuario a borrar:"
	read nombreUsuario
	
	userdel $nombreUsuario
	
	echo "---------------------------------------"
	echo "El usuario $nombreUsuario ha sido borrado."
	echo "---------------------------------------"
}

borrarGrupo() {
	echo "Borrando un grupo..."
	
	echo "Introduce el nombre del grupo a borrar:"
	read nombreGrupo
	
	groupdel $nombreGrupo
	
	echo "---------------------------------------"
	echo "El grupo $nombreGrupo ha sido creado."
	echo "---------------------------------------"
}

agregarUsuarioAGrupo() {
	echo "Añadiendo usuario a un grupo..."
	
	echo "Introduce el nombre de usuario:"
	read nombreUsuario
	echo "Introduce el nombre del grupo:"
	read nombreGrupo
	
	usermod -aG $nombreGrupo $nombreUsuario
	
	echo "---------------------------------------"
	echo "El usuario $nombreUsuario ha sido añadido al grupo $nombreGrupo."
	echo "---------------------------------------"
}

borrarUsuarioDeGrupo() {
	echo "Borrando usuario de un grupo..."
	
	echo "Introduce el nombre de usuario:"
	read nombreUsuario
	echo "Introduce el nombre del grupo:"
	read nombreGrupo
	
	echo "---------------------------------------"
	deluser $nombreUsuario $nombreGrupo
	echo "---------------------------------------"
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
