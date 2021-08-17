=setup.sh setup=

- In the setup.sh file add the following script 

Below is without you mail (recommended)
{{{bash
mkdir -p ~/.streamlit/

echo "\
[server]\n\
headless = true\n\
port = $PORT\n\
enableCORS = false\n\
\n\
" > ~/.streamlit/config.toml	
}}}




