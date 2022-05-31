const http = require('http')
const https = require('https')

const params = process.argv
const hostname = ~params.indexOf('--hostname') ? params[params.indexOf('--hostname') + 1] : null
const port = ~params.indexOf('--port') ? params[params.indexOf('--port') + 1] : null
const count = ~params.indexOf('--count') ? +params[params.indexOf('--count') + 1] : 1000

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

const request = (options, data) => {
    return new Promise((resolve, reject) => {
        const protocol = options.hostname === 'localhost' ? http : https

    const req = protocol.request(options, (res) => {
        let result = ''

      res.on('data', (chunk) => result += chunk)

      res.on('end', () => resolve(result))

      res.on('error', (err) => {
          console.error(err)

        reject(err)
      })
    })

    req.on('error', (err) => {
        console.error(err)

      reject(err)
    })

    req.write(data)

    req.end()
    })
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

const loadTest = async () => {
    const data = JSON.stringify({ metadata: {} })

  const options = {
      hostname,
      port,
      path: '/network/list',
      method: 'POST',
      headers: {
          'Content-Type': 'application/json',
      },
  }

  const networkResponse = await request(options, data)

  const { network_identifiers: [network_identifier] } = JSON.parse(networkResponse)

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  {
      console.time('/construction/combine')

    const data = JSON.stringify({
        network_identifier,
        unsigned_transaction: '',
        signatures: [],
    })

    const options = {
        hostname,
        port,
        path: '/construction/combine',
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
    }

    const requests = [...Array(count)].map(() => request(options, data))

    await Promise.all(requests)

    console.timeEnd('/construction/combine')
  }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  {
      console.time('/network/list')

    const data = JSON.stringify({ metadata: {} })

    const options = {
        hostname,
        port,
        path: '/network/list',
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
    }

    const requests = [...Array(count)].map(() => request(options, data))

    await Promise.all(requests)

    console.timeEnd('/network/list')
  }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  {
      console.time('/mempool')

    const data = JSON.stringify({ network_identifier, metadata: {} })

    const options = {
        hostname,
        port,
        path: '/mempool',
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
    }

    const requests = [...Array(count)].map(() => request(options, data))

    await Promise.all(requests)

    console.timeEnd('/mempool')
  }
}

loadTest()