#' Nettoyer les fichiers temporaires
#'
#' @param temp_dir Répertoire temporaire à nettoyer
cleanup_temp_files <- function(temp_dir) {
  if (dir.exists(temp_dir)) {
    unlink(temp_dir, recursive = TRUE)
    cat("Fichiers temporaires nettoyés\n")
  }
}
