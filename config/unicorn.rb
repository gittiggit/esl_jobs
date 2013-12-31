root = "/home/mashpy/apps/esl_jobs/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.esl_jobs.sock"
worker_processes 2
timeout 30