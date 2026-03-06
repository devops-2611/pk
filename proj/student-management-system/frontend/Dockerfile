FROM node:24-alpine
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
# ENV VITE_BACKEND_URL=http://sbe:5000
ENV VITE_BACKEND_URL=http://localhost:5000
RUN npm run build
EXPOSE 4173
CMD ["npm", "run", "preview"]