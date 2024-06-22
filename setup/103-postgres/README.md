# Postgres

To deploy postgres with persistence we need a pvc, it is important to note that while using the `bitnami/postgresql` we 
may encounter issues, since the pvc is only populated once, for example changing env variables has no effect after the first deployment. 