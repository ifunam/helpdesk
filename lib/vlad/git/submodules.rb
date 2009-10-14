module Vlad::Git::Submodules

 # A copy of Vlad::Git#checkout, but also inits submodules. 
  #   
  def checkout(revision, destination) 
    destination = File.join(destination, 'repo') 
    revision = 'HEAD' if revision =~ /head/i 
 
    [ "rm -rf #{destination}", 
     "#{git_cmd} clone #{repository} #{destination}", 
     "cd #{destination}", 
     "#{git_cmd} checkout -f -b deployed-#{revision} #{revision}", 
     "git submodule init",
     "git submodule -q update", #--init,  This line is added to make sure submodules are fetched too. 
     "cd -" 
    ].join(" && ") 
  end

  def export(revision, destination) 
 revision = 'HEAD' if revision =~ /head/i
    revision = "deployed-#{revision}"
    [ "mkdir -p #{destination}", 
     "cd repo", 
     "git-archive-all.sh #{application}.tar", # write complete project to a tarball with git-archive-all 
     "cat #{application}.tar | (cd #{destination} && tar xf -)", # untar it in the release directory 
     "rm -f #{application}.tar", # remove the temporary tarball 
     "cd -", 
     "cd .." 
    ].join(" && ") 
  end  
end
