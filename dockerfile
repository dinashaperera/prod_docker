FROM mybase:latest as build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
COPY . .
RUN npm run build


FROM mybase:latest
WORKDIR  /usr/src/app
COPY --from=build /usr/src/app/dist ./dist
COPY package.json package-lock.json ./
RUN npm install --only=production
EXPOSE 3000
CMD ["npm", "start"]