FROM public.ecr.aws/lambda/nodejs:20

# Copy function code
COPY handler.js ${LAMBDA_TASK_ROOT}
COPY package*.json ${LAMBDA_TASK_ROOT}/

# Install dependencies to make package large (>250MB)
WORKDIR ${LAMBDA_TASK_ROOT}
RUN npm install \
    @tensorflow/tfjs-node \
    sharp \
    canvas \
    puppeteer

# Optional: Copy large data files
# COPY large-data/ ${LAMBDA_TASK_ROOT}/data/

CMD [ "handler.handler" ]