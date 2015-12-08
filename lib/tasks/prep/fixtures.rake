namespace :prep do
  desc 'Build spec fixtures'
  task :fixtures do
    Rake::Task['ensure:fixtures'].invoke
    Dir.chdir('fixtures/vagrant') do
      tasks = capture_stdout { Rake::Task['list'].invoke }.split(/\n/)
      tasks.each do |task|
        FileUtils.mkdir_p(task)
        Dir.chdir(task) do
          puts "vagrant init #{task} ."
          system "vagrant init #{task} ."
        end
      end
    end
  end
end
