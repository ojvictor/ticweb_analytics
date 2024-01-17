require 'mechanize'
require 'pg'
require 'filequeue'
require 'concurrent'
require 'csv'
require 'uri'

PAGES = '/home/jvictor/Documents/Pessoal/ufmg/repositorios/ases_reeavalue/scratch/pages_date.10000'

def config
  queue = Queue.new
  CSV.foreach(PAGES, headers: true) do |row|
    page = {}
    page['site'] = URI.parse(row['page']).host
    page['page'] = row['page']
    page['date_time'] = row['date_time']
    page['rating_score'] = row['rating_score']
    page['total_errors'] = row['total_errors']
    page['total_warnings'] = row['total_warnings']
    queue << page
  end
  queue
end

def insert(page, conn)
  puts "#{page}"
  conn.exec_params('INSERT INTO a11y.pages (site, page, date_time, rating_score, total_errors, total_warnings ) 
    VALUES ($1, $2, $3, $4, $5, $6)', [page['site'], page['page'], page['date_time'], page['rating_score'],
    page['total_errors'], page['total_warnings']])
  puts 'Dados inseridos com sucesso.'
rescue PG::Error => e
  puts 'Erro ao conectar no banco'
  puts e.message
end

begin
  conn = PG.connect(
    dbname: 'ticweb',
    user: 'postgres',
    password: 'ticweb123',
    host: 'localhost',
    port: 5432
  )
  threads = []
  mutex = Mutex.new
  pages_queue = config

  20.times do
    threads << Thread.new do
      until pages_queue.empty?
        begin
          page = pages_queue.pop
          sleep(0.3) unless page
        rescue ThreadError
          break
        end
        mutex.synchronize do
          insert(page, conn)
        end
      end
    end
  end
  threads.each(&:join)
ensure
  conn&.close
end
