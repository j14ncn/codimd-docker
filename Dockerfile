FROM quay.io/codimd/server:1.4.0

#RUN grep -r "cdnjs.cloudflare.com" *|awk -F ":" {'print $1'}|uniq |xargs sed -i 's,integrity[^>]*, ,g'

#RUN grep -r "cdnjs.cloudflare.com" * |awk -F ":" {'print $1'} |uniq |xargs sed -i 's,https://cdnjs.cloudflare.com/ajax/libs/,https://cdn.bootcss.com/,g'

#RUN grep -r "cdnjs.cloudflare.com" * |awk -F ":" {'print $1'} |uniq |xargs sed -i 's,https://cdnjs.cloudflare.com,https://cdn.bootcss.com,g'

#RUN grep -r "cdnjs.cloudflare.com" *|awk -F ":" {'print $1'}|uniq |xargs sed -i 's,integrity[-="a-zA-Z0-9/+]*",,g'
RUN sed -i 's,100000,500000,g' /codimd/lib/config/default.js

# codimd默认只能上传图片.添加了一堆MimeTypes,支持上传更多格式文件.
COPY --chown=codimd:root index.js /codimd/lib/config/
# 修改default为application/octet-stream.
COPY --chown=codimd:root utils.js /codimd/lib/
# 修改登录,只保留sso登录
COPY --chown=codimd:root body.ejs /codimd/public/views/index/
