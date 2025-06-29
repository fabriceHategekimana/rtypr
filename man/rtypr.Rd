\name{install_from_github_release}
\alias{install_from_github_release}
\title{Install File from GitHub Release}
\description{
Downloads and installs a file from a GitHub release to a Windows system path.
}
\usage{
install_from_github_release(repo_url, file_pattern, install_path = NULL,
                          tag_name = "latest", create_shortcut = FALSE,
                          add_to_path = FALSE)
}
\arguments{
\item{repo_url}{GitHub repository URL in format "owner/repo"}
\item{file_pattern}{Regular expression pattern to match the file}
\item{install_path}{Installation path (default: Program Files)}
\item{tag_name}{Release tag name (default: "latest")}
\item{create_shortcut}{Create desktop shortcut (default: FALSE)}
\item{add_to_path}{Add to system PATH (default: FALSE)}
}
\value{
Returns TRUE if installation succeeds, FALSE otherwise.
}
\examples{
\dontrun{
install_from_github_release("owner/repo", "\\.exe$")
}
}

