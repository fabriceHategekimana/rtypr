#' Download and install TypR 
#'
#' @param add_to_path Ajouter au PATH système (par défaut: FALSE)
#'
#' @return TRUE if the installation worked, otherwise FALSE
#' @export
install_typr <- function(add_to_path = TRUE) {
	typr_url <- "https://github.com/fabriceHategekimana/typr/releases/latest/download/typr.exe"
    install_path <- file.path("C:", "Program Files (x86)", "typr")
    dest_file <- file.path(install_path, "typr.exe")

    # Créer le répertoire d'installation
    if (!dir.exists(install_path)) {
      dir.create(install_path, recursive = TRUE, showWarnings = FALSE)
    }

	download.file(typr_url, dest_file)
    # Rendre le fichier exécutable
	Sys.chmod(dest_file, mode = "0755")
	add_to_system_path(install_path)
      
   cat("Installation terminée avec succès!\n")
      return(TRUE)
}


#' Ajouter un chemin au PATH système
#'
#' @param path_to_add Chemin à ajouter au PATH
#'
#' @return TRUE si ajouté avec succès
add_to_system_path <- function(path_to_add) {
  # Vérifier si le chemin est déjà dans le PATH
  current_path <- Sys.getenv("PATH")
  if (grepl(path_to_add, current_path, fixed = TRUE)) {
    cat("Le chemin est déjà dans le PATH système\n")
    return(TRUE)
  }
  
  # Ajouter au PATH utilisateur via le registre
  reg_command <- sprintf('reg add "HKCU\\Environment" /v PATH /t REG_EXPAND_SZ /d "%s;%s" /f', 
                        Sys.getenv("PATH"), path_to_add)
  
  result <- system(reg_command, intern = TRUE)
  
  cat("Chemin ajouté au PATH utilisateur. Redémarrez votre session pour que les changements prennent effet.\n")
  return(TRUE)
}
