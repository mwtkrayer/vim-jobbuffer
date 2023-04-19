command! -nargs=* JobBuffer call s:job_buffer(<f-args>)

" Runs a command in /bin/sh without blocking and pipes output to a new buffer
function! s:job_buffer(...)
  let jobcmd  = ['/bin/sh','-c']+[join(a:000)]
  let datestr = strftime("%FT%T")
  let bufname = 'JobBuffer-'.datestr
  let bufnr = bufadd(bufname)
  call setbufvar(bufnr,'&buflisted',1)
  call setbufvar(bufnr,'&buftype','nofile')
  call bufload(bufnr)
  let job = job_start(jobcmd,{'out_io': 'buffer', 'out_buf': bufnr})
	let ji=job_info(job)
	call setbufline(bufnr,1,['Command: '.join(a:000),'PID: '.ji["process"],'----------']) 
endfun
