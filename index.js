const AWS = require('aws-sdk')

AWS.config.update({ region: 'eu-west-3' })
const s3 = new AWS.S3()

exports.handler = (event) => {
  let data = event.Records[0].s3

  let param = {
    Bucket: data.bucket.name,
    Key: data.object.key,
    ACL: 'public-read',
  }

  console.log('Put `public-read` for:', data.object.key)
  s3.putObjectAcl(param, (err, data) => {
    if (err) console.log('err:', err)
    else console.log('data:', data)
  })
}
