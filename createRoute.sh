#!/bin/bash

# Read the route name from user input
read -p "Enter the route name: " routeName

# Create the route files
touch src/routes/${routeName}Routes.ts
touch src/controllers/${routeName}Controllers.ts
touch src/services/${routeName}Services.ts

# Add the route template to the respective files
echo "import express, { Request, Response } from 'express';" >> src/routes/${routeName}Routes.ts
echo "import { ${routeName}Controller } from '../controllers/${routeName}Controllers';" >> src/routes/${routeName}Routes.ts
echo "" >> src/routes/${routeName}Routes.ts
echo "const router = express.Router();" >> src/routes/${routeName}Routes.ts
echo "" >> src/routes/${routeName}Routes.ts

# todo add route path logic
echo "router.get('/', ${routeName}Controller);" >> src/routes/${routeName}Routes.ts

echo "" >> src/routes/${routeName}Routes.ts
echo "export { router as ${routeName}Routes };" >> src/routes/${routeName}Routes.ts
echo "" >> src/routes/${routeName}Routes.ts

echo "import { Request, Response } from 'express';" >> src/controllers/${routeName}Controllers.ts
echo "" >> src/controllers/${routeName}Controllers.ts
echo "export const ${routeName}Controller = (req: Request, res: Response) => {" >> src/controllers/${routeName}Controllers.ts
echo "  // TODO: Implement get${routeName} logic" >> src/controllers/${routeName}Controllers.ts
echo "  res.send('GET ${routeName}');" >> src/controllers/${routeName}Controllers.ts
echo "};" >> src/controllers/${routeName}Controllers.ts
echo "" >> src/controllers/${routeName}Controllers.ts

echo "export const ${routeName}Service = {" >> src/services/${routeName}Services.ts
echo "  // TODO: Implement ${routeName} service methods" >> src/services/${routeName}Services.ts
echo "};" >> src/services/${routeName}Services.ts

# Add the route module to the respective index files
echo "export * from './${routeName}Routes';" >> src/routes/index.ts
echo "export * from './${routeName}Controllers';" >> src/controllers/index.ts
echo "export * from './${routeName}Services';" >> src/services/index.ts

# Reference the route in src/index.ts
echo "import { ${routeName}Routes } from './routes/${routeName}Routes';" >> src/index.ts
echo "app.use(\"/\", ${routeName}Routes);" >> src/index.ts

echo "New route '${routeName}' has been created successfully!"