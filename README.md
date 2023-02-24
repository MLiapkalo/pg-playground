<h2>Preconditions</h2>
<p>Docker installed on your machine.</p>
<h2>How can I start?</h2>
<ol>
    <li>Run <code>docker compose up</code> from project root dir.</li>
    <li>Go to <code>localhost:5050</code>, enter password (<code>root</code>, if not modified in Docker Compose)</li>
    <li>Click on "Add New Server"</li>
    <li>In General tab type in any name</li>
    <li>
        In Connection tab fill in<br/>
        "Host name/address" - <code>pg-playground-db</code><br/>
        "Maintenance database" - <code>pg-playground</code><br/>
        "Username" and "Password" - <code>root</code><br/>
        <strong>Note:</strong> values may be different if you change them in <code>docker-compose.yml</code>
    </li>
    <li>Enjoy 🙃</li>
</ol>
<h2>How can I configure DB?</h2>
<p>
    You can tune <code>postgresql.conf</code> file. Some options may require restart. 
    For configuration file reference see <code>postgresql.conf.sample</code>.
</p>
<p>
    In case you would like to change initial DB structure add/remove/modify SQL files inside <code>initdb</code> folder.
</p>