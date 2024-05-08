#! /bin/bash
python -c "try:
    import faiss
    print('faiss successfully imported.')
except ImportError:
    print('faiss could not be imported. Please make sure it is installed correctly.')
"
